# J'Donuts App

A Flutter client for the Madivizion senior Flutter code test. It covers registration, an offline catalog, product detail, rewards, and a saved cart.

Built with Flutter 3.41.9 and Dart 3.11.5.

## What the test is asking

The PDF is a hiring exercise, not a request to ship a real shop. Three tasks carry the work:

1. **Registration.** Phone, fake OTP `123456`, name, and date of birth, with every rule checked and a session that survives a restart.
2. **Home and product detail, offline.** Products, banners, shops, and one member live in a local database. The screens still render with no network.
3. **Rewards.** The points ring, tier ladder, tabs, and challenge art animate from that same saved member.

A saved cart is marked optional. I added one anyway, because Add to cart should leave something you can open later. Checkout then places those items at the front of Order again.

The test fails outright only if the app does not build from this README, crashes on the main path, or keeps its catalog hard-coded inside widgets. The screens read Drift.

## What is in the app

- Onboarding, then phone, OTP, name, and date of birth. A new number registers and lands on Welcome. A known number skips name and date of birth and goes from OTP straight to Home. Log out is in Settings.
- Welcome, then Home: member header, banner carousel, Seasonal specials, Popular, Order again, and a horizontal list of nearby shops. Scrolling Home covers the banner with the sections. The first online load shows a skeleton for 4 seconds.
- Product detail for every product: code, MMK price with thousands separators, New badge, description under What's this?, quantity from 1, and a live total joined with ` | `.
- Rewards: a CustomPainter points ring, Silver / Gold / Platinum shields, a sliding Eat more earn more / Gift indicator, staggered cards, quarter-filled donut photos, and a coffee arc. A finished Earn saves points on the shared member row and adds 1 to the Rewards badge.
- **Cart.** Add to cart writes the line into the local database. The bag opens **Your cart**. The same product adds onto one line. The quantity can change, and Remove deletes the line. Checkout clears the cart and puts those products at the front of Order again. The list is still there after the app restarts.
- Bottom navigation shows Home, Reward, Cart, and Settings. Inbox is not on the bar.

Explore now and Order online do not perform a real action. The PDF says those controls only need to be visible.

## How I thought about it

**One database, every screen.** Home and Rewards read the same `members` row. A new registration starts that row at 0 points, so both screens show the fresh state. The seed profile is also 0 points. Earned points and the Rewards badge stay on that row when the catalog refreshes. The tier label is derived from the saved points, so the two screens cannot drift apart.

**The UI does not own the data.** `assets/seed/catalog.json` is copied into Drift on launch. A local mock catalog client reads that same JSON. When the device is online, Home waits 4 seconds, then writes the database. Offline, and after a failed refresh, the screens keep showing the saved rows. Pictures are bundled assets. A network image is only a fallback, cached on disk, so airplane mode still shows them. Seasonal specials and Popular always come from the seed. Order again starts from the seed and then keeps whatever Checkout added.

**Clean architecture, one tool for state.** Features are `auth`, `home`, `product`, `rewards`, `cart`, and `shell`. Each feature that owns data splits into domain, data, and presentation. Domain has no Flutter imports. Models are immutable. Riverpod creates the database, the repositories, and the screen state. Navigation is `go_router`, with an auth guard and a `/product/:id` route. Widgets do not construct services, and I did not add a second injector.

**Rules live where a test can call them.** Phone, OTP, name, and date of birth are pure functions. After `+95`, spaces, dashes, and one leading `0` are stripped. The number must be `9` followed by 7 to 9 digits (`09254135592` becomes `+959254135592`). OTP is 6 digits. `123456` passes. Anything else shakes, clears, and locks after 3 wrong tries until resend. The resend countdown is 5:00. Date of birth must be a real calendar date, not in the future, and the person must be at least 13 (`AgePolicy.minimumYears`). The session is stored with `flutter_secure_storage`. Relaunch while logged in opens Home. Logged out opens Onboarding.

**Motion is named, and it can be skipped.** Durations and curves sit in `lib/core/motion/motion.dart`. Registration steps slide on a shared axis. OTP to Home fades and slides in. Welcome slides the donut tiles in, then fades the title up. Home shimmers, auto-plays the banner, brings each section in, and lets the list scroll over the banner. Rewards counts the total and the ring together, up to a full circle at 680,000. The ladder appears in order, the tab indicator slides, cards stagger, the donut fills by quarters, and the coffee arc fills from its saved progress. The bottom-nav pill slides. `MediaQuery.disableAnimations` and Reduce Motion shorten those to nothing. Tests turn motion off so a repeating animation cannot stall them.

**The cart is a table, not a memory list.** A snackbar alone would match the PDF, and the button still shows "Added to cart". I also store `productId` and `quantity` in Drift. The database is schema version 4. Opening the bag from product detail is `context.push('/cart')`. The Cart tab shows the same screen. Setting the quantity to 0 deletes the row. Checkout remembers the purchased product ids, then deletes the lines.

## Walk through it

1. Start the app. **Let's get started.**
2. Enter a Myanmar mobile number, then `123456`.
3. For a new number, enter a name and a date of birth for someone at least 13.
4. On Welcome, tap the explore target. Home shows the name you entered, with 0 points.
5. Open a product. Change the quantity. The button total is price times quantity.
6. Tap **Add to cart**. The snackbar has **View cart**. The bag shows the count.
7. Open the cart and tap **Checkout**. Those items appear at the front of Order again.
8. Open Reward. The ring counts with the saved total. Tap a finished **Earn**. The total and the Rewards badge both go up, and Home shows the same points.
9. Settings, **Log out**, then log in again with the same number. OTP goes straight to Home. The cart lines are still in the database.
10. Turn the network off. Home, the product, Rewards, and the cart still open. An offline banner shows. Turn the network back on and the catalog refreshes in the background. Pull to refresh does the same.

The sample number `09254135592` is stored as `+959254135592`.

## Run

```bash
flutter pub get
flutter run
```

Stop the app and run it again after a new asset or a database schema change. Hot reload does not pick those up.

The Drift code in `lib/core/database/app_database.g.dart` is already generated. After a table change:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Localization comes from `lib/l10n/app_en.arb` and `lib/l10n/app_my.arb`. English and Burmese are both supported.

```bash
flutter gen-l10n
```

## Test

```bash
flutter analyze
flutter test
```

`flutter analyze` uses `flutter_lints` and is clean.

`flutter test` covers the phone, name, date, and OTP rules, the registration screens, the cart quantity rule, checkout writing Order again, claiming a finished challenge, the mock catalog envelope, and the path from Register through OTP `123456` to the Coconut Donut (`JD022123`, 3,200 MMK).

The same registration path can be driven on a device with:

```bash
flutter test integration_test/register_flow_test.dart
```

## Layout

```text
lib/
  core/          theme, motion, Drift, router, mock catalog, shared widgets
  features/
    auth/        rules, repository, registration screens
    home/        catalog read from Drift
    product/     detail for /product/:id
    rewards/     earn and gift tabs, ring, tier ladder
    cart/        saved lines, checkout, and the cart screen
    shell/       bottom navigation
assets/
  seed/catalog.json
  images/        bundled photos used offline
```

Colors, type, and spacing live in `lib/core/theme`.

## Known gaps

- The catalog client is a local mock over the bundled JSON. There is no remote server.
- Explore now and Order online are display only.
- Inbox is hidden. Settings can change language and log out. It is not a full settings screen.
- There is no payment step after Checkout. Checkout only saves the order into Order again.
- Product and shop art are bundled stand-ins, not a live photo service.
- A profile-mode frame-time recording is not in the repository.
- Design screenshots are not in the repository.

## Time

The three tasks were built in one working session on this machine: architecture, screens, the offline database, and the tests. The saved cart, checkout, rewards claim, and the later visual passes were added after that.
