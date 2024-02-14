
class Todo{
  final int id;
  final String title;
  final String createdAt;
  final String? updatedAt;
  Todo({
    required this.id,
    required this.title,
    required this.createdAt,
    this.updatedAt
});
}