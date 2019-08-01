In a doubly linked list, each node not only contains a reference or pointer to the **next node**, but it contains a pointer to the **previous node** in the sequence, The most common use of a doubly linked list is on navigation systems where both front and back navigation is required (*traversing the list forward or backward*), the best example of this is a browser and how it manages the next or previous page button, and also a lot of applications implement this list to make use of the Undo and Redo button functionality that is often found in many applications.

![doubly.png](doubly.png)


## Example

This example demonstrates how to build a doubly-link linked list using **Python**

### Node class

Our Node class is the foundation on which we will build our linked list, so it is very important to define all the necessary attributes that we will use later one, in this case as an example we will only work with a parameter **id**, to store some kind of id (school id for example), but more parameters can be easily added, it is also important to note that we will begin to work with **links** or **pointers** at this time, and in our constructor we will assign both the **next and previous** pointers to None (null) because we are not building the list just yet.

``` python
class Node:
    #Remember that we do not need to declare our class attributes
    #in Python, only assign those attributes through our constructor
    def __init__(self, id):     #constructor of class Node
        self.id = id            #assign the value sent as a parameter to our class atribute
        self.next = None        #assign the next pointer link to None (null)
        self.previous =  None   #assign the previous pointer link to None (null)
```

### DoublyLinkedList class

Our doubly linked list class is not more than a **collection of methods** utilized to alter in many different ways our doubly linked list, here we can include methods such as: **add()**, **delete()**, **find()**, **traverse()**, **print_list(direction)**, etc. in this example we will explore two methods: **add()** and **print_list(direction)**, but more can be easily implemented, it is important to note that more often than note **recursion** is a good way of building this methods, although iteration tends to be faster, as this is a beginner example we will use iteration for the methods listed above.

``` python
class DoublyLinkedList:
    def __init__(self):         #constructor of class DoublyLinkedList
        self.head = None        #start our list empty, hence our head is None (null)

    #ADD method
    def add(self,node):
        if self.head is None:   #verify if our LinkedList is empty
            self.head = node    #if is empty assign the first node to our head
        else:
            temp = self.head
            while temp.next is not None:    #iterate through our list until
                temp  = temp.next           #-we reach the end of it
            temp.next = node                #assign the next pointer link of the last element to our new element
            node.previous = temp            #assign the previous pointer link of the new element to our last element

    #PRINT method
    def print_list(self,direction):
        if self.head is None:                       #verify if our LinkedList is empty
            print('The list is empty')              #print a warning
        else:
            if direction is 'forward':              #check for direction sent as a parameter
                temp = self.head
                while temp.next is not None:        #iterate thru the list to print each element
                    print(temp.id,end='')           #print each element
                    print('->',end='')
                    temp = temp.next
                print(temp.id)
            elif direction is 'backward':           #check for direction sent as a parameter
                temp = self.head
                while temp.next is not None:        #get to the last element of the list
                    temp = temp.next
                while temp.previous is not None:    #iterate backwards thru the list to print each element
                    print(temp.id,end='')           #print each element
                    print('->',end='')
                    temp = temp.previous
                print(temp.id)
            else:
                print('Error, wrong direction to print list specified')
```

### DoublyLinkedList instance

Finally we create a new instance of out DoublyLinkedList, add a couple of values and print our list to check if its working correctly.


``` python
list2 = DoublyLinkedList()      #create a new DoubleLinkedList
list2.add(Node(1))              #add element 1
list2.add(Node(2))              #add element 2
list2.add(Node(3))              #add element 3
list2.print_list('forward')     #print the list forward
list2.print_list('backward')    #print the list backward
```

### Output

Our output should look something like this.

``` bash
1->2->3
3->2->1
```
