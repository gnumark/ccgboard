class User {
	public:
	User();
	char *name, *surname, *login, *pwd;
	void load_deck();
	void del_deck();
	Deck get_deck(int idx);
	Deck *list_decks();
	private:
	Deck *d_array;
}

class AI {
	public:
	private:
}


