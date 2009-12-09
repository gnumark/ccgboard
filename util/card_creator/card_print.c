#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <gd.h>
#include <gdfontmb.h>
#include <gdfontl.h>
#include <gdfonts.h>
#include <gdfontt.h>
#include <gdfontg.h>

#define DEFAULT_COLOR "1b6491"


/* GLOBALS */

char *faction[] = {"General","Underground","Corporative","Crime","Police"};
char *type[] = {"Node","Cracker","Chip","Smartcard","Event"};

typedef struct card {
	char *rarity, *name, *type, *subtype, *faction, *cost, *prod, *mconn, *Mconn, *defense, *attack, *AP, *mem, *slot, *VP, *bonus;
//					*attack, *AP, *cost, *faction, *prod, *mconn, *Mconn, *defense, *mem, *slot, *VP, *bonus ;
	struct card *ptr;
}card;

FILE *tmpl, *csv , *xml;
char *file1, *file2, *file3  ;

int ALPHA = 0;
int default_template = 0;
gdImagePtr cardimg;
card *cardcsv;

gdImagePtr write_card(card *card , char *oname);
card *read_csv_file(card *ptr);
hextodec(char *in,int carray[]); 
usage(char *cname) ;
open_templates(char **argv);
/* END OF GLOBALS */

int main(int argc, char **argv) 
{
//	time_t *t = (time_t*)malloc(sizeof(time_t));
//	struct tm *now;
	int i,n;
	FILE *output;
	void *color = NULL;

	cardcsv = malloc(sizeof(card));
	memset(cardcsv, 0, sizeof(card));
	// initialise internals
//	date  = (char *)malloc(sizeof(char) * 2);
	tmpl = xml = csv = output = NULL;
//	time(t);
//	now = localtime(t);
//	month = (char *)malloc(sizeof(char) * 3); 
//	sprintf(date,"%d",now->tm_mday);
//	sprintf(month,"%s",months[now->tm_mon]);

	// and if args are present...parse command line
	if(argc > 1) {
		for(i=1;i<argc;i++) {
			if(argv[i][0] != '-') { 
				usage(argv[0]);
				exit(0);
			}
			switch(argv[i][1]) {
				case 'h':
					usage(argv[0]);
					exit(0);
					break;
				case 'c':
					i++;
					file2 = strtok(argv[i],",");
					break;
				case 't':
					i++;
					file1 = strtok(argv[i],",");
					break;
				default:
					usage(argv[0]);
					exit(-1);
			}
		}
	}
	file1 = "./template.png";

	open_templates(argv);
	printf("\ntemplate file was found!! \n");

	// if we obtain the image pointer, let's do the job
	if(cardimg != NULL && cardcsv != NULL) {
		char oname[25] = "./cardAAAAAAAAA.png";
		char path[20] = "./img/";
		int x = 0;
		
		tmpl = fopen(file1,"r");
		cardimg = gdImageCreateFromPng(tmpl); 
		fclose(tmpl);
		cardimg = write_card(cardcsv, oname);
		output = fopen(oname,"w");
		gdImagePng(cardimg,output);
		fclose(output);
	//	printf("Passed first write_ \n");

		char tmp[2] ;
		int c = 6;
		int t=0;
		for (x=0;cardcsv->ptr != NULL;x++) {
			tmpl = fopen(file1,"r");
			
			cardimg = gdImageCreateFromPng(tmpl); 
			fclose(tmpl);
			cardcsv = cardcsv->ptr;
			t++;
			if (t > 20) {c++ ; t=0;}
			oname[c]=t+64;
			cardimg = write_card(cardcsv,oname);
//			itoa(x,tmp,10);
//			oname[6]=tmp[0];
//			oname[7]=tmp[1];
			output = fopen(oname,"w");
			gdImagePng(cardimg,output);
			fclose(output);
	//		cardcsv = &cardcsv->ptr;
		}
		tmpl = fopen(file1,"r");
		cardimg = gdImageCreateFromPng(tmpl); 
		fclose(tmpl);
		cardcsv = cardcsv->ptr;
		oname[c]=t+65;
		cardimg = write_card(cardcsv,oname);
	//		itoa(x,tmp,10);
	//		oname[6]=tmp[0];
	//		oname[7]=tmp[1];
		output = fopen(oname,"w");
		gdImagePng(cardimg,output);
		fclose(output);

		// and write down the card ... 
		
		// and now it's time to free all memory
		gdImageDestroy(cardimg);
	}
	else {
		printf("\nBad file or some weird problem creating png from template:\n  %s\n\n",file1);
		exit(-1);
	}
	// it seems that all went ok ... notify it and free memory
	printf("Calendar icons created!! \n");
	return 1;
}

gdImagePtr write_card(card *_card, char *oname )
{
	// write down the card 
	// take an image pointer and a card struct to fill fields

	char filet[40]="./template.png";
	gdImagePtr img;
		tmpl = fopen("./template.png","r");
		img = gdImageCreateFromPng(tmpl); 
		fclose(tmpl);
	int black = 0;
	int	namexl = 2 + img->sx /2 - (strlen(_card->name) * gdFontGiant->w / 2);
	int	namext = 2 + img->sx /2 - (strlen(_card->name) * gdFontSmall->w / 2);
  int namey = 7;
	int costx = 5 + img->sx  - (strlen(_card->cost) * gdFontGiant->w )-12;
	int costy = 7;
	int typex = 10; 
	int typey = img->sy /2 +5;
	int descrx = 40; 
	int descry = 45;
//	int factx = img->sx - (strlen(_card->faction) * gdFontSmall->w )-10;
//	int facty = img->sy /2 +5;
	int factx = 18;
	int facty = 7;
	int bonusx = 20; 
	int bonusy = img->sy /2 +25;
	int sx = 12; 
	int s1y = 30;
	int s2y = 45; 
	int s3y = 60;
	int s4y = 75; 
	int s5y = 90;
	int s6y = 105;
	char defense[6]= "D"; 
	strcat(defense, _card->defense);
	char attack[6]= "A"; 
	strcat(attack, _card->attack);
	char mconn[6]= "m"; 
	strcat(mconn, _card->mconn);
	char Mconn[6]= "M"; 
	strcat(Mconn, _card->Mconn);
	char slot[6]= "S"; 
	strcat(slot, _card->slot);
	char mem[6]= "me"; 
	strcat(mem, _card->mem);
	char AP[6]= "AP"; 
	strcat(AP, _card->AP);
	char VP[8] = "VP";	
	strcat(VP, _card->VP);
	char tmpfile1[40]="./tmp-";
	if (!strcmp(_card->type,"Node") ) {
		strcat(tmpfile1, "no"); 
		strcat(tmpfile1, _card->faction); 
		strcat(tmpfile1, ".png"); 
		tmpl = fopen(filet,"r");
//		tmpl = fopen(filet,"r");
		img = gdImageCreateFromPng(tmpl); 
		fclose(tmpl);
	// prod
	gdImageString(img,gdFontGiant,
		costx,costy,
		_card->prod, black);
			// slot
			gdImageString(img,gdFontSmall,
				sx,s4y,
				slot, black);
			// mem
			gdImageString(img,gdFontSmall,
				sx, s5y,
				mem, black);
			// defense
			gdImageString(img,gdFontSmall,
				sx, s3y, 
				//_card->defense, black);
				defense, black);
			// mconn
			gdImageString(img,gdFontSmall,
				sx, s1y,
				mconn, black);
			// Mconn
			gdImageString(img,gdFontSmall,
				sx, s2y,
				Mconn, black);
			// Data Point
			gdImageString(img,gdFontSmall,
				sx, s6y,
				VP, black);
	 } else if (!strcmp(_card->type,"Cracker") ) {
		strcat(tmpfile1, "cr"); 
		strcat(tmpfile1, _card->faction); 
		strcat(tmpfile1, ".png"); 
		tmpl = fopen(filet,"r");
		img = gdImageCreateFromPng(tmpl); 
		fclose(tmpl);

	// cost
	gdImageString(img,gdFontGiant,
		costx,costy,
		_card->cost, black);
			// attack
			gdImageString(img,gdFontSmall,
				sx, s1y,
				attack, black);
			// AP
			gdImageString(img,gdFontSmall,
				sx, s3y,
				AP, black);
			// defense
			gdImageString(img,gdFontSmall,
				sx, s2y,
				defense, black);
	 } else if (!strcmp(_card->type,"Chip") ) {
		strcat(tmpfile1, "ch"); 
		strcat(tmpfile1, _card->faction); 
		strcat(tmpfile1, ".png"); 
		tmpl = fopen(filet,"r");
		img = gdImageCreateFromPng(tmpl); 
		fclose(tmpl);
	// cost
	gdImageString(img,gdFontGiant,
		costx,costy,
		_card->cost, black);
			// attack
			gdImageString(img,gdFontSmall,
				sx, s2y,
				attack, black);
			// defense
			gdImageString(img,gdFontSmall,
				sx, s3y,
				defense, black);
			gdImageString(img,gdFontSmall,
				sx, s1y,
				mem, black);

	 } else if (!strcmp(_card->type,"Smartcard")) {
	// cost
		strcat(tmpfile1, "sm"); 
		strcat(tmpfile1, _card->faction); 
		strcat(tmpfile1, ".png"); 
		tmpl = fopen(filet,"r");
		img = gdImageCreateFromPng(tmpl); 
		fclose(tmpl);
	gdImageString(img,gdFontGiant,
		costx,costy,
		_card->cost, black);
 } else if (!strcmp(_card->type,"Event")) {
	// cost
		strcat(tmpfile1, "ev"); 
		strcat(tmpfile1, _card->faction); 
		strcat(tmpfile1, ".png"); 
		tmpl = fopen(filet,"r");
		img = gdImageCreateFromPng(tmpl); 
		fclose(tmpl);
	gdImageString(img,gdFontGiant,
		costx,costy,
		_card->cost, black);
	}
	// name write
	if (strlen(_card->name) < 14) {
		gdImageString(img,gdFontGiant,
			namexl,namey,
			_card->name, black);
	} else {
		gdImageString(img,gdFontSmall,
			namext,namey,
			_card->name, black);
	}
	// type write
	gdImageString(img,gdFontSmall,
		typex,typey,
		_card->type, black);
	// faction
	gdImageString(img,gdFontGiant,
		factx,facty,
		_card->faction, black);
	gdImageString(img,gdFontGiant,
		descrx,descry,
		_card->type, black);

	// bonus
	int i;
	char *cb = _card->bonus;
	for (i=0;strlen(cb) >= 22;i+=12) {
		char *c;
		c = calloc(23,sizeof(char));
		int cnt = 22;
		for (cnt=22;cb[cnt] != 32;cnt--) { 
		}
		snprintf(c,cnt+1,"%s",cb);
		gdImageString(img,gdFontSmall,
			bonusx,bonusy+i,
			c, black);
		cb += cnt+1;
	}
	if (strlen(cb) > 1) {
		char c2[24];
		snprintf(c2,23,"\0");
		strncpy(c2,cb,strlen(cb)-1);
		gdImageString(img,gdFontSmall,
		bonusx,bonusy+i,
		c2, black);
	}
		char *c3;
		c3 = calloc(2048,sizeof(char));
		strncpy(c3,_card->bonus,strlen(_card->bonus)-1);
	xml = fopen ("./Cyberdeck-card.xml","a");
	fprintf (xml, "\n<card name=\"%s\" text=\"\" graphics=\"%s\" >",_card->name,oname);
	fprintf (xml, "\n<attr key=\"rarity\" value=\"%s\" />",_card->rarity);
	fprintf (xml, "\n<attr key=\"type\" value=\"%s\" />",_card->type);
	fprintf (xml, "\n<attr key=\"faction\" value=\"%s\" />",_card->faction);
	fprintf (xml, "\n<attr key=\"cost\" value=\"%s\" />",_card->cost);
	fprintf (xml, "\n<attr key=\"prod\" value=\"%s\" />",_card->prod);
	fprintf (xml, "\n<attr key=\"minconn\" value=\"%s\" />",_card->mconn);
	fprintf (xml, "\n<attr key=\"maxconn\" value=\"%s\" />",_card->Mconn);
	fprintf (xml, "\n<attr key=\"defense\" value=\"%s\" />",_card->defense);
	fprintf (xml, "\n<attr key=\"attack\" value=\"%s\" />",_card->attack);
	fprintf (xml, "\n<attr key=\"AP\" value=\"%s\" />",_card->AP);
	fprintf (xml, "\n<attr key=\"mem\" value=\"%s\" />",_card->mem);
	fprintf (xml, "\n<attr key=\"slot\" value=\"%s\" />",_card->slot);
	fprintf (xml, "\n<attr key=\"VP\" value=\"%s\" />",_card->VP);
	fprintf (xml, "\n<attr key=\"bonus\" value=\"%s\" />",c3);
	fprintf (xml, "\n</card>");
	fclose(xml);
	return img;
	
}

card *read_csv_file(card *ptr)
{
	// read csv card file and create the array of card 
//	month = (char *)malloc(sizeof(char) * 3); 
//	sprintf(date,"%d",now->tm_mday);
	return ptr;
}

open_templates(char **argv)
{

	int i,j;
	char *buf,*buf2;
	tmpl = fopen(file1,"r");
	csv = fopen(file2,"r");
	if(tmpl == NULL) {
		if(tmpl = fopen("./template.png","r")) {
			file1=malloc(sizeof(char) * 16);
			sprintf(file1,"%s","./template.png");
			printf("Using template.png as image template \n");
			default_template = 1;
		}
		else {
			printf("\nNo template file was found!! \n");
			printf("It must be named card-tmpl.png and must\n");
			printf("reside in my current working directory\n");
			printf("or try to use -t <tmpl> to specify one\n\n");
			usage(argv[0]);
			exit(-1);
		}
	}
	cardimg = gdImageCreateFromPng(tmpl); 
	fclose(tmpl);
	if(csv == NULL) {
		if(csv = fopen("./card.csv","r")) {
			printf("Using card.csv as csv \n");
			default_template = 1;
		}
		else {
			printf("\nNo template file was found!! \n");
			printf("It must be named card-tmpl.png and must\n");
			printf("reside in my current working directory\n");
			printf("or try to use -t <tmpl> to specify one\n\n");
			usage(argv[0]);
			exit(-1);
		}
	}
//	read_csv_file(cardcsv);
	buf = malloc(sizeof(char) * 4);
	buf2 = malloc(sizeof(char) * 92024);
	*buf2=0;
	// parsing csv
	printf("Parsing CVS File\n");
	card *tmp;
	tmp = malloc(sizeof(card));
	memset(tmp, 0, sizeof(card));
	tmp = cardcsv;

	for (j=0;fgets(buf2,92023,csv);j++) {
		char *c,**d;
		card *tmphead;
		tmphead = tmp;
		c = strtok(buf2,",");
		d = (char *)tmp;
		do {
			int cl = strlen(c);
			// next value
			*d = malloc(cl+1);
			i++;
			if (*c == '"') {
				c++;
				strncpy(*d,c,cl-2);
				((char *)*d)[cl-2] = '\0'; 
			} else {
				strcpy(*d,c);
			}
			(char *)d += sizeof(char *);
			*buf2 =0; 
		} while (c = strtok(NULL,","));
		*d = malloc(sizeof(card *));
		tmp = malloc(sizeof(card));
		memset(tmp, 0, sizeof(card));
		tmphead->ptr = tmp;
		printf("Card %d done",i);
		i=0;
		//(char *)d += sizeof(card *);
	}
	fclose(csv);
}

usage(char *cname) 
{
	printf(
/*   %s [<option>] ...  [<option>]

   Options: 
      -h	
         prints this help.
			-c <file.csv>
      -t <tmpl>
         use <tmpl> as template image to use instead of default file
         card-tmpl.png found in CWD.

         Example:
            %s -t $template_path/$template_name
            %s -c $csv_path/$csv_name

         If alternative tmpl images are used they have to be a PNG image file.
*/
"Usage: ",cname,cname,cname);
}






hextodec(char *in,int carray[]) 
{
	int r,g,b,i;
	char *hexstr = (char *)malloc(sizeof(char) * 6);
	strcpy(hexstr,in);
	for(i=0;i<6;i++){
		if(hexstr[i] == 'a' || hexstr[i] == 'A') {
			hexstr[i] = '9' + 1;
		}
		else if(hexstr[i] == 'b' || hexstr[i] == 'B') {
			hexstr[i] = '9' + 2;
		}
		else if(hexstr[i] == 'c' || hexstr[i] == 'C') {
			hexstr[i] = '9' + 3;
		}
		else if(hexstr[i] == 'd' || hexstr[i] == 'D') {
			hexstr[i] = '9' + 4;
		}
		else if(hexstr[i] == 'e' || hexstr[i] == 'E') {
			hexstr[i] = '9' + 5;
		}
		else if(hexstr[i] == 'f' || hexstr[i] == 'F') {
			hexstr[i] = '9' + 6;
		}
	}

	carray[0] = (hexstr[0] - '0') * 16 + (hexstr[1] - '0');
	carray[1] = (hexstr[2] - '0') * 16 + (hexstr[3] - '0');
	carray[2] = (hexstr[4] - '0') * 16 + (hexstr[5] - '0');
	free(hexstr);
}


