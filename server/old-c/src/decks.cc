
class Deck {
	public:
	Deck();
	Deck(int index);
	Card *a_deck_head;
	Card look_next_card();
	bool push(Card *crd);	
	Card pop();
	int get_cardnum();
	void shuffle();
	private:
	// index of last element of the list of cards
	int _idx;
	int _card_num;
	Card *_deck;
}

int Deck:get_cardnum() {
	return _card_num;
}

Deck:Deck() {
}

Deck:Deck(int index) {
}

Card Deck:look_next_card() {
	return a_deck_head;
}
bool Deck:push(Card *crd) {
	a_deck_head[_idx] = crd;
	_idx++;
	return TRUE;
}
Card Deck:pop() {
	Card app = a_deck_head;
	a_deck_head++;
	return app;
}
void Deck:shuffle() {
}


