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

  void convert() {
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
  }

  List<Node> get getPostfix {
    return postfixNodeList;
  }
}

String evaluatePostfix(List<Node> list) {
  double res = 0;
  Stack<Node> stack = Stack();
  int ptr = 0;
  try {
    while (ptr < list.length) {
      var currentNode = list[ptr];
      if (currentNode.type == Type.Number)
        stack.push(currentNode);
      else if (currentNode.type == Type.Operator) {
        var op2 = double.parse(stack.pop().value);
        var op1 = double.parse(stack.pop().value);
        switch (currentNode.value) {
          case '+':
            res = op1 + op2;
            break;
          case '-':
            res = op1 - op2;
            break;
          case '×':
            res = op1 * op2;
            break;
          case '÷':
            res = op1 / op2;
            break;
          default:
            res = 0;
        }
        Node resNode = new Node(value: res.toString(), type: Type.Number);
        stack.push(resNode);
      }
      ptr++;
    }
    var finalAns = double.parse(stack.pop().value);
    if (stack.isEmpty) if (finalAns.truncate() == finalAns)
      return finalAns.truncate().toString();
    else
      return finalAns.toString();
    else
      return "NA";
  } catch (e) {
    return "NA";
  }
}
