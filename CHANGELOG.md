# Changelog

## 1.4.0 (09-Jun-23)

* Renamed `narrators` method to `narrator` for `TournamentSynchRequests` (thanks, @L-Eugene)

## 1.3.0 (18-Nov-22)

* Added `create_result` method for the `Tournament` model and `create_tournament_result`, `update_tournament_result`, `delete_tournament_result` methods.
* Added `update` and `destroy` methods for the `Player` model as well as `update_player` and `delete_player` methods (thanks, @DasRegal)
* Added `create_player` method.
* Added `create_team`, `update_team`, and `delete_team` methods.
* Added `update` and `destroy` method to the `Team` model.

## 1.2.0 (17-Oct-22)

* Properly handle flat params:

```ruby
client.tournaments 'type[]': [1, 2, 3] # requesting tournaments with IDs 1, 2, or 3
```

## 1.1.0 (29-Jul-22)

* Added requests for venues (thanks, @L-Eugene)

## 1.0.1 (28-Jul-22)

* Fixed endpoint reinitialization (thanks, @L-Eugene)
* Minor fixes

## 1.0.0 (12-Apr-22)

* Stable release

## 1.0.0.rc1 (11-Apr-22)

* Initial release