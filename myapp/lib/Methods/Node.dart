import 'package:flutter/material.dart';

enum Type { Operator, Number }
var base = 10;

class Node {
  Type type;
  String value;
  List<Node> children = [];
  Node({this.value, this.type});
  void add(Node n) {
    switch (type) {
      case Type.Number:
        value += n.value;
        break;
      case Type.Operator:
        Node m = new Node(value: n.value, type: n.type);
        for (Node c in n.children) {
          m.add(c);
        }
        children.add(m);
        break;
    }
  }

  double evaluate() {
    if (type == Type.Number)
      return double.parse(value);
    else if (children.length >= 2) {
      switch (value) {
        case "×":
          return children[0].evaluate() * children[1].evaluate();
        case "÷":
          return children[0].evaluate() / children[1].evaluate();
        case "+":
          return children[0].evaluate() + children[1].evaluate();
        case "–":
          return children[0].evaluate() - children[1].evaluate();
      }
    } else {
      return double.nan;
    }
  }

  String toString() {
    if (children.isEmpty) {
      return value;
    }
    String str = children.first.toString();
    str += value;
    for (int i = 1; i < children.length; i++) {
      str += children[i].toString();
    }
    return str;
  }
}

int priority(String value) {
  switch (value) {
    case "(":
      return 3;
    case "×":
      return 2;
    case "÷":
      return 2;
    case "+":
      return 1;
    case "–":
      return 1;
    default:
      return 10;
  }
}

class ExprTree {
  Node root;
  ExprTree() {
    root = null;
  }
  void add(Node n) {
    if (root == null) {
      switch (n.type) {
        case Type.Number:
          root = n; //adding first operator
          break;
        case Type.Operator:
          //err
          break;
      }
    } else {
      switch (n.type) {
        case Type.Number:
          Node last = root;
          while (last.children.length >= 2) {
            last = last.children.last;
          }
          last.add(n);
          break;
        case Type.Operator:
          if (priority(n.value) >= priority(root.value)) {
            Node last = root.children.last;
            Node parent = root;
            bool stop = false;
            while (!stop) {
              stop = true;
              for (Node child in last.children) {
                if (child.type == Type.Operator &&
                    priority(n.value) >= priority(child.value)) {
                  parent = last;
                  last = child;
                  stop = false;
                }
              }
            }
            if (last.type == Type.Operator) {
              parent = last;
              last = last.children.last;
            }
            n.add(last);
            parent.children.last = n;
          } else {
            n.add(root);
            root = n;
          }
          break;
      }
    }
  }

  void backspace() {
    if (root.children.isEmpty) {
      switch (root.type) {
        case Type.Operator:
          root = null;
          break;
        case Type.Number:
          String s = root.value;
          root.value = s.substring(0, s.length - 1);
          break;
      }
    } else {
      Node parent = root;
      Node tobeDeleted = root.children.last;
      while (tobeDeleted.children.isNotEmpty) {
        parent = tobeDeleted;
        tobeDeleted = tobeDeleted.children.last;
      }
      switch (tobeDeleted.type) {
        case Type.Operator:
          parent.children.removeLast();
          break;
        case Type.Number:
          String s = tobeDeleted.value;
          tobeDeleted.value = s.substring(0, s.length - 1);
          break;
      }
    }
  }

  double evaluate() {
    if (root == null) {
      return 0;
    } else {
      return root.evaluate();
    }
  }

  String toString() {
    if (root == null) {
      return "";
    } else {
      return root.toString();
    }
  }
}

ExprTree exprTree = new ExprTree();

class Tokenizer {
  String ip;
  int ptr;
  Tokenizer(this.ip) {
    ptr = 0;
  }

  Node getToken() {
    Node n = new Node();
    if (ptr >= ip.length) return null;
    List operators = ['+', '–', '×', '÷', '(', ')'];
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
