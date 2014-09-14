#include <iostream>
#include <string>
using namespace std;


class User
{

public:

	enum Group { ADMIN, MODERATOR, USER, BANNED };

private:

	string username;
	string email;
	Group group;

public:

	User (string username_, string email_, Group group_) : username(username_), email(email_), group(group_) {}
	
	User (string username_) : username(username_), group(BANNED) {}

	User (const User& original) : username(original.username), email(original.email), group(original.group) {}

	string getUsername () const { return username; }

	bool equal (const User& right) const
	{
		return username == right.username;
	}

	void post (string msg) const
	{
		if ( group == BANNED ) return;

		cout << "Message left from: " << username << endl;
		cout << msg << endl;
		cout << "Contact me at: " << email << endl;
	}
};

typedef User Data;

//typedef int Data;



class List 
{

	struct Node
	{
		Data 	data;
		Node* 	next;

		Node (Data data_, Node* next_ = NULL) : data(data_), next(next_) {}
	};
	
	
	Node* 		first;
	Node* 		last;
	unsigned int 	nodes;


public:


	class Iterator
	{
		Node* node;

	public:

		Iterator (Node* node_) : node(node_) {}

		Iterator next (int amount = 1)
		{
			for ( int i = 0 ; i < amount ; i++ ) node = node->next;
			return Iterator (node);
		}

		bool equal (Iterator right)
		{
			return node == right.node;
		}

		Data& data () { return node->data; }

		Node* container () { return node; }
	};

	// Iterator at the beginning of the list
	Iterator begin () { return Iterator (first); }
	// Iterator *after* the end of the list
	Iterator end () { return Iterator (NULL); }


	Iterator insert (Data data_, bool atEnd = true)
	{
		nodes++;
		Node* tmp;
		if ( atEnd )
		{
			tmp = new Node (data_);

			// list is empty
			if ( last == NULL )
			{
				first = tmp;
				last = tmp;
			}
			else
			{
				last->next = tmp;
				last = last->next;
			}
		}
		else
		{
			tmp = new Node (data_, first);

			// list is empty
			if ( first == NULL )
			{
				first = tmp;
				last = tmp;
			}
			else
				first = tmp;
		}
		return Iterator (tmp);
	}

	// Insert after position
	Iterator insert (Data data_, Iterator position)
	{
		Node* current = position.container();
		if ( current == NULL ) return insert (data_, false);

		Node* tmp = new Node (data_, current->next);

		// last node
		if ( current->next == NULL ) last = tmp;

		current->next = tmp;

		nodes++;

		return position.next();
	}
	
	Iterator find (Data data_, Iterator after = Iterator(NULL))
	{
		Node* afterPos = after.container();
		Node* tmp = (afterPos == NULL ? first : afterPos->next);
		while ( tmp != NULL )
		{
			//if ( tmp->data == data_ ) break;
			if ( tmp->data.equal(data_) ) break;
			tmp = tmp->next;	
		}
		return Iterator (tmp);
	}
	
	void remove (Data data_, Iterator after = Iterator(NULL))
	{
		Node* afterPos = after.container();
		Node* tmp = (afterPos == NULL ? first : afterPos->next);
		Node* prev = (afterPos == NULL ? NULL : afterPos);
		while ( tmp != NULL )
		{
			//if ( tmp->data == data_ )
			if ( tmp->data.equal(data_) )
			{
				// update first
				if ( prev == NULL) first = first->next;
				else prev->next = tmp->next;

				// update last
				if ( tmp->next == NULL ) last = prev;

				nodes--;
				delete tmp;
				break;
			}
			prev = tmp;
			tmp = tmp->next;
		}
	}

	void update (Data data_, Iterator pos)
	{
		pos.data() = data_;
	}


	unsigned int size () { return nodes; }


	List () : first(NULL), last(first), nodes(0) {}

	List (Iterator& itStart, Iterator& itEnd) : first(NULL), last(first), nodes(0)
	{
		for ( ; !itStart.equal( itEnd ) ; itStart.next() )
			 insert ( itStart.data() );
	}

	List (const List& original)
	{
		for ( Node* tmp = original.first ; tmp != NULL ; tmp = tmp->next )
			insert ( tmp->data );
	}


	~List ()
	{
		Node *temp, *i = first;
		while (i != NULL)
		{
			temp = i;
			i = i->next;
			delete temp;
		}
	}
};


/* =========================================================================== */

int main ()
{

	List list;
	list.insert (User("george", "a@bc.com", User::ADMIN));
	list.insert (User("sdi1200321", "b@dc.com", User::USER));
	list.insert (User("testUser", "nomail@bc.com", User::USER));
	list.insert (User("Vicky", "b@bc.com", User::MODERATOR));
	list.insert (User("errikos", "c@bc.com", User::MODERATOR));

	List::Iterator it = list.begin();
	it.next(); it.next();
	it = list.insert (User("stef", "stf@stf.com", User::ADMIN), it);
	list.insert (User("sdi1200333", "c@dc.com", User::USER), it);

	for ( it = list.begin() ; !it.equal( list.end() ) ; it.next() )
		cout << it.data().getUsername() << endl;

	it = list.find (User("george"));
	if ( !it.equal( list.end() ) ) cout << "USER FOUND!" << endl;
	else cout << "USER NOT FOUND!" << endl;

	list.remove (User("testUser"), it);

	list.update (User("sdi1100400", "d@dc.com", User::USER), it);

	for ( it = list.begin() ; !it.equal( list.end() ) ; it.next() )
		cout << it.data().getUsername() << endl;
		
	User u("ge", "asdas", User::USER);
	u.post("SADASDAS");
	const User l("ge", "sadasd", User::MODERATOR);
	l.post("AAAA");
	if ( u.equal(l) ) cout << "A" << endl;
	if ( l.equal(u) ) cout  << "B" << endl;

/*
	List list;
	list.insert (1);
	list.insert (2);
	list.insert (10);
	list.insert (4);
	list.insert (2);

	List::Iterator it = list.begin();
	it.next(); it.next();
	it = list.insert (90, it);
	list.insert (2, it);

	for ( it = list.begin() ; !it.equal( list.end() ) ; it.next() )
		cout << it.data() << endl;

	it = list.find (15);
	if ( !it.equal( list.end() ) ) cout << "15 FOUND!" << endl;
	else cout << "15 NOT FOUND!" << endl;
	it = list.find (10);
	if ( !it.equal( list.end() ) ) cout << "10 FOUND!" << endl;
	else cout << "10 NOT FOUND!" << endl;

	it = list.find (2);
	it = list.find (2, it);
	list.remove (2, it);

	list.update (123, it);

	for ( it = list.begin() ; !it.equal( list.end() ) ; it.next() )
		cout << it.data() << endl;
*/
}

