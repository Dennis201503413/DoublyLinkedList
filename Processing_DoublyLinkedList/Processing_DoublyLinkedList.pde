/*
--------------------------------
Developed by                    |
user: Dennis Masaya             |
id: 201503413                   |
e-mail: dennismasaya@gmail.com  |
--------------------------------
This example demonstrates how to build a doubly linked list, we use 
2 classes: 1) Node_doubly and 2)DoublyLinkedList, our node class only 
has the attributes and a constructor to add value to those attributes, 
and our DoublyLinkeList class has 2 methods (more can be easily implemented) 
1)add and 2)print_list, add is self-explanatory, print receives a String parameter
which defines wheter we traverse the list 'forward' or 'backward', in this case
we only use a "head" to implement a Doubly Linked List, but other "helper nodes" 
can be defined such as "tail" to make backward traversing easier and faster with 
large sets of data, finally on our setup method we create, add elements and finally 
print our LinkedList.
*/

void setup(){
  DoublyLinkedList l2 = new DoublyLinkedList(); //create a new DoublyLinkedList
  l2.add(new Node_doubly(0)); //add element 0
  l2.add(new Node_doubly(1)); //add element 1
  l2.add(new Node_doubly(2)); //add element 2
  l2.add(new Node_doubly(3)); //add element 3
  l2.print_list("forward"); //print the list traversing it forward
  l2.print_list("backward"); //print the list traversing it backward
}

/*=========== DOUBLY LINKED LIST ===========*/
/*--NODE--*/
class Node_doubly{
 Node_doubly next;
 Node_doubly previous;
 int id;

 Node_doubly(int id){
   this.id = id;
 }
}
/*--END NODE--*/

/*--LIST--*/
class DoublyLinkedList{
  Node_doubly head;
//ADD
  void add(Node_doubly n){
    if(head==null){
      head = n;
    }else{
      Node_doubly temp = head;
      while(temp.next!=null){
        temp = temp.next;
      }
      temp.next = n;
      n.previous = temp;
    }
  }
//PRINT
  void print_list(String direction){
    if(direction.equals("forward")){
      Node_doubly temp = head;
      while(temp.next!=null){
        print(temp.id+"->");
        temp = temp.next;
      }
      print(temp.id);
      println();
    }else if(direction.equals("backward")){
      Node_doubly temp = head;
      while(temp.next!=null){
        temp = temp.next;
      }
      while(temp.previous!=null){
        print(temp.id+"->");
        temp = temp.previous;
      }
      print(temp.id);
      println();
    }else{
      println("!Error! not defined");
    }
  }
}
/*--END LIST--*/
/*=========== END DOUBLY LINKED LIST ===========*/
