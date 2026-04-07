# A7gezly

## What is this?
A marketplace mobile app for youth (ages 15-25) to book local football and padel courts in Egypt. Built with Flutter. Designed to feel fast, energetic, and addictive — like Booking.com meets Airbnb for sports.

## Tech Stack
- **Framework:** Flutter (Dart)
- **State Management:** StatefulWidget + setState (consider Riverpod as app grows)
- **Backend:** TBD
- **Target Platforms:** Android & iOS

## Design System
- **Theme:** Light/white base — bright, clean, everyday app for youth
- **Background:** Light grey (`#F7F7F9`)
- **Surfaces:** Pure white (`#FFFFFF`) for cards and containers
- **Primary:** Vibrant green (`#00C853`) — CTAs, selected states, success
- **Secondary:** Electric blue (`#2979FF`) — info, time highlights, links
- **Coral:** Hot red (`#FF5252`) — urgency, favorites, errors
- **Orange:** Energetic orange (`#FF6D00`) — flash deals, high demand, warnings
- **Star Gold:** (`#FFC107`) — ratings, achievements
- **Text:** Dark (`#1A1D26`) primary, grey (`#6B7280`) secondary, muted (`#A0A6B1`)
- **Gradients:** primaryGradient, coralGradient, blueGradient — for CTAs, badges, accents
- **Border Radius:** 16-20px cards, 12-14px chips/inputs
- **Shadows:** Subtle (`#14000000`) for card elevation
- **Colors defined in:** `lib/core/theme/app_theme.dart` — always use `AppColors` constants

## Project Structure
```
lib/
  core/
    theme/
      app_theme.dart           # AppColors + AppTheme (light theme)
  models/
    court.dart                 # Court + FlashSlot models
    booking.dart               # BookingSummary + PaymentMethod models
    time_slot.dart             # TimeSlot, Amenity + VenueMockData
    mock_data.dart             # Home screen mock data
  screens/
    main_shell.dart            # Root widget — IndexedStack + bottom nav (4 tabs)
    auth/
      auth_screen.dart         # Login / Signup with social auth
    home/
      home_screen.dart         # Discovery feed
      widgets/
        home_app_bar.dart          # Avatar + greeting + location + bell
        search_filter_bar.dart     # Search + color-coded filter chips
        flash_slots_section.dart   # Flash deals horizontal list
        top_courts_section.dart    # Main court cards (Airbnb style)
    venue_details/
      venue_details_screen.dart    # Venue + date/time selection
      widgets/
        hero_image_section.dart    # Hero image with overlays
        venue_info_header.dart     # Name, rating, location, type badge
        urgency_banner.dart        # Social proof banner
        amenities_row.dart         # Amenity chips
        date_picker_strip.dart     # 7-day picker
        time_slots_grid.dart       # Available/selected/booked grid
        sticky_bottom_bar.dart     # Price + proceed CTA
    checkout/
      checkout_screen.dart         # Payment flow + success dialog
      widgets/
        booking_summary_card.dart  # Booking summary
        price_breakdown.dart       # Fee breakdown
        payment_method_selector.dart # Payment options
        cancellation_policy.dart   # Policy warning
        swipe_to_pay_button.dart   # Swipe-to-confirm slider
    bookings/
      bookings_screen.dart         # Upcoming/Past tabs with booking cards
    wallet/
      wallet_screen.dart           # Balance card, quick top-up, transactions
    profile/
      profile_screen.dart          # Profile, stats, referral, settings, sign out
```

## Coding Conventions
- Keep widgets modular — one widget per file under `widgets/`
- Use `const` constructors wherever possible
- Use `AppColors` from theme, never hardcode hex values
- Use gradients (`AppColors.primaryGradient` etc.) for primary CTAs
- Prices are in EGP (Egyptian Pounds)
- Use Unicode emoji characters directly
- Use `withValues(alpha: x)` instead of deprecated `withOpacity()`
- Cards use white background + subtle shadow for elevation
- Bottom nav lives in `MainShell`, not individual screens

## Navigation Flow
- Auth → MainShell (Home / Bookings / Wallet / Profile)
- Home → Venue Details → Checkout → Success → Home
- Profile → Sign Out → Auth

## App Screens
- [x] Auth (Login / Signup)
- [x] Home / Discovery
- [x] Venue Details + Time Selection
- [x] Checkout & Payment
- [x] My Bookings (Upcoming / Past)
- [x] Wallet (Balance + Transactions)
- [x] Profile (Stats + Settings)

## Commands
- `flutter analyze` — lint check
- `flutter run` — run on connected device/emulator
- `flutter test` — run widget tests
