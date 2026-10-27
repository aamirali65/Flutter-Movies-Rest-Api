# Flutter-Movies-Rest-Api

A Flutter app that pulls data from a public REST API and renders it — the standard first walk through HTTP, JSON and list rendering in Dart.

## How it works

- `lib/services/api_fetch.dart` holds an `Api` class with a single `fetchApi()` method: it issues a `GET` to `https://www.episodate.com/api/most-popular?page=1` with the `http` package, returns the raw response body on a 200, and returns `0` on anything else
- `lib/main.dart` calls it and renders the results

## Stack

Flutter · Dart · `http`

## Running

```bash
flutter pub get
flutter run
```

Needs network access; the API is public and needs no key.

## Notes

The API call returns an unparsed string, so the screen works directly with the response body — decoding it into typed models is the natural next step. Network errors currently surface as a `0` rather than an error state.
