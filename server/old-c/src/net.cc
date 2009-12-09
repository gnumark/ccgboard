typedef struct net {
	int idx;
	Card *placed;
	char *zone;
	Card *ne_c, *nw_c, *e_c, *w_c, *se_c, *sw_c;
}
