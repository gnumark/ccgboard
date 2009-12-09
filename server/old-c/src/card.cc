
class Card {
	public:
	Card();
	Card(char *name,char *faction, char *type, int attack, int defense, int AP, int cost, int mconn, int Mconn, int prod, int mem, int slot, Image *img, char *bonus, void *bonus_cond, void *bonus_run);
	char *get_name();
	char *get_faction();
	char *get_type();
	int get_attack();
	int get_defense();
	int get_mem();
	int get_slot();
	int get_AP();
	int get_mconn();
	int get_Mconn();
	int get_prod();
	int get_cost();
	char *get_bonus();
	bool run_bonus();
	bool cond_bonus();
	Image *get_img();
	private:
	char *_name, *_faction, *_type, *_bonus;
	int _attack, _AP, _cost, _mconn, _Mconn, _prod, _defense, _mem, _slot;
	Image *_img;
	void *_bonus_cond , *_bonus_run;
}

Card:Card {
	return TRUE;	
}

Card:Card(char *name,char *faction, char *type, int attack, int defense, 
				 int AP, int cost, int mconn, int Mconn, int prod, int mem, 
				 int slot, Image *img, char *bonus, void *bonus_cond, void *bonus_run) {
	// Constructor that create the card
	_name = name;
	_faction = faction;
	_type = type;
	_attack = attack;
	_defense = defense;
	_AP = AP;
	_cost = cost;
	_mconn = mconn;
	_Mconn = Mconn;
	_prod = prod;
	_mem = mem;
	_slot = slot;
	_img = img;
	_bonus = bonus;
	_bonus_cond = bonus_cond;
	_bonus_run = bonus_run;
}

char *Card:get_name() {
	return _name;
}

char *Card:get_faction() {
	return _faction;
}

char *Card:get_type() {
	return _type;
}

int Card:get_attack() {
	return _attack;
}

int Card:get_defense() {
	return _defense;
}

int Card:get_mem() {
	return _mem;
}

int Card:get_slot() {
	return _slot;
}

int Card:get_AP() {
	return _AP;
}

int Card:get_mconn() {
	return _mconn;
}

int Card:get_Mconn() {
	return _Mconn;
}

int Card:get_prod() {
	return _prod;
}

int Card:get_cost() {
	return _cost;
}

char *Card:get_bonus() {
	return _bonus;
}

bool Card:run_bonus() {
	return TRUE ;
}

bool Card:cond_bonus() {
	return TRUE;
}

Image *Card:get_img() {
	return _img;
}



