class PlaceSuggestionModel {
  final String placeId;
  final String description;
  PlaceSuggestionModel(this.placeId, this.description);

  @override
  String toString() {
    return "Suggestion(description: $description, id: $placeId)";
  }
}
