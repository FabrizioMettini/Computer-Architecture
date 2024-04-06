int find(const char *s1, char c, unsigned l);
int compare(const char *s1, const char *s2, unsigned l);

int bruteforce2(const char *S, const char *s, unsigned lS, unsigned ls)
{
    int i, j;
    i = j = 0;

    while (i < lS - ls + 1) {
        j = find(S+i, s[0], lS-i);
        
        if (j == -1) {
            break;
        }
            
        if (compare(S+i+j, s, ls)) {
            return i+j;
        } else {
            i += j + 1;
        }
        
    }
    return -1;
}
