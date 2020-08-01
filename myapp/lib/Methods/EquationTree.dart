Node root = Node(value: 1, type: Type.t_root);

class Node {
  Type type;
  double value;
  Node({this.value, this.type});

  List<Node> operands;

  void addOperand(Node n) {
    operands.add(n);
  }

  void removeOperand() {
    operands.removeLast();
  }
}

enum Type {
  t_root,
  t_operator,
  t_number,
}
