
// Game management
class Game {
	public:
	Game();
	void run_game();
	int get_type();
	void set_type(int type);
	int list_types();
	void set_user(User *users);
	char *list_users();
	void load_pl_field();
	void set_status(int stat);
	int get_status();
	void get_pl_field();
	private:
	int _phase;
	Deck *_pl_decks;
	void *_network;
	void _node_ph();
	void _buy_ph();
	void _event_ph();
	void _ap_ph();
	void _res_ph();
	void _smart();
}

class CyberDeck {
	public:
	CyberDeck();
	void run();
	Game create_game();
	private:
}

CyberDeck:run () {
	Game *game ;
	game->create_game();
	game->run_game();
	return;
}

Game CyberDeck:create_game() {
	Game *game = new Game();
	int g_types = game->list_types();
	// hardcoded type   setting 
	// 1 is 2 player
	game->set_type(1);	
	User *user1 = new User();
	User *user2 = new User();
	game->set_users(user1,user2);
	return game;
}

main () {
	CyberDeck *central = new CyberDeck();
	central->run();
	exit(0);
}
