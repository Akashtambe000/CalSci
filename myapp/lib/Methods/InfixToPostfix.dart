import './Node.dart';
import 'package:stack/stack.dart';

class IToP {
  final List<Node> infixNodeList;
  List<Node> postfixNodeList = [];
  Stack<Node> stack = Stack();

  IToP(this.infixNodeList);

  int ipr(Node ch) {
    switch (ch.value) {
      case "(":
        return 3;
      case "×":
        return 2;
      case "÷":
        return 2;
      case "+":
        return 1;
      case "-":
        return 1;
      default:
        return -1;
    }
  }

  int rpr(Node ch) {
    switch (ch.value) {
      case "(":
        return 0;
      case "×":
        return 2;
      case "÷":
        return 2;
      case "+":
        return 1;
      case "-":
        return 1;
      default:
        return -1;
    }
  }

  List<Node> convert() {
    for (int i = 0; i < infixNodeList.length; i++) {
      var currentNode = infixNodeList[i];

      if (currentNode.value == "(") {
        stack.push(currentNode);
      } else if (currentNode.value == ")") {
        while (stack.isNotEmpty) {
          var element = stack.pop();
          if (element.value == "(") {
            break;
          }
          postfixNodeList.add(element);
        }
      } else if (currentNode.type == Type.Operator) {
        while (stack.isNotEmpty && ipr(currentNode) <= rpr(stack.top())) {
          postfixNodeList.add(stack.pop());
        }
        stack.push(currentNode);
      } else if (currentNode.type == Type.Number) {
        postfixNodeList.add(currentNode);
      }
    }

    while (stack.isNotEmpty) {
      postfixNodeList.add(stack.pop());
    }

    return postfixNodeList;
  }
}
