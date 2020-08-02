enum Type {
  Operator,
  Number,
}

class Node {
  Type type;
  String value;
  Node({this.value, this.type});
}

class Tokenizer {
  String ip;
  int ptr;
  Tokenizer(this.ip) {
    ptr = 0;
  }

  Node getToken() {
    Node n = new Node();
    if (ptr >= ip.length) return null;
    List operators = ['+', '-', '×', '÷', '(', ')'];
    if (operators.contains(ip[ptr])) {
      n.value = ip[ptr];
      n.type = Type.Operator;
      ptr++;
    } else {
      String number = '';
      while (ptr < ip.length && !operators.contains(ip[ptr])) {
        number += ip[ptr];
        ptr++;
      }
      n.value = number;
      n.type = Type.Number;
    }
    return n;
  }

  List<Node> getInfixNodeList() {
    List<Node> l = [];
    while (ptr < ip.length) {
      Node n = getToken();
      l.add(n);
    }
    return l;
  }
}
