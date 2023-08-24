#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>


#define LOG_TAG "writer"

int main(int argc, char*argv[])
{
    openlog( LOG_TAG, LOG_PID, LOG_USER);

    if(argc != 3)
    {
        syslog(LOG_ERR, " Need two arguments ");
        syslog(LOG_ERR, "1)Need a full path.");
        syslog(LOG_ERR, "2)Please enter a text stream. ");
        closelog();
        return 1;

    }

    const char *f_name = argv[1];
    const char *writestr = argv[2];

    
    FILE * fpt = fopen(f_name, "w");
    
    if(fpt == NULL)
    {
        syslog(LOG_ERR, "Failed to open file %s", f_name);
        closelog();
        return 1;
    }


    // else{
    //     fputs(argv[2], fpt);
    //     fputs("\n", fpt);
    //     syslog(LOG_DEBUG, "Writing %s", argv[2], argv[1]);

    // }

    fprintf(fpt, "%s\n", writestr);

    fclose(fpt);

    syslog(LOG_DEBUG, "Writing \"%s\" to \"%s\"", writestr, f_name);

    closelog();

    
    return 0;
}













// int main(int argc, char*argv[])
// {
//     openlog(NULL, LOG_CONS | LOG_PID | LOG_NDELAY, LOG_USER);

//     if(argc != 3)
//     {
//         syslog(LOG_ERR, " Need two arguments ");
//         syslog(LOG_ERR, "1)Need a full path.");
//         syslog(LOG_ERR, "2)Please enter a text stream. ");
//         closelog();
//         return 1;

//     }

//     const char *writefile = argv[1];
//     const char *writestr = argv[2];

    
//     FILE * file = fopen(writefile, "w");
    
//     if(file == NULL)
//     {
//         syslog(LOG_ERR, "Failed to open file %s", argv[1]);
//         closelog();
//         return 1;
//     }
//     else{
//         fputs(argv[2], file);
//         fputs("\n", file);
//         syslog(LOG_DEBUG, "Writing %s", argv[2], argv[1]);

//     }

//     fprint(file, "%s\n", writestr);

//     fclose(file);

//     syslog(LOG_DEBUG, "Writing \"%s\" to \"%s\"", writestr, writefile);

//     closelog();

    
//     return 0;
// }







// int main(int argc, char*argv[])
// {
//     openlog(NULL, LOG_CONS | LOG_PID | LOG_NDELAY, LOG_USER);

//     if(argc < 3)
//     {
//         syslog(LOG_ERR, " need specified argument");
//         closelog();
//         return 1;

//     }
//     else if(argc > 3)
//     {
//         syslog(LOG_ERR, "Too muchargument specified");
//         closelog();
//         return 1;

//     }

//     if( ( argv[2] == NULL) || (strlen(argv[2]) <=0 ))
//     {
//         syslog(LOG_ERR, "Incorrect string");
//         closelog();
//         return 1 ;

//     }

//     FILE * filepointer = NULL ;
//     filepointer = fopen(argv[1], "wr");
//     if(filepointer == NULL)
//     {
//         syslog(LOG_ERR, "Failed to open file %s", argv[1]);
//     }
//     else{
//         fputs(argv[2], filepointer);
//         fputs("\n", filepointer);
//         syslog(LOG_DEBUG, "Writing %s", argv[2], argv[1]);

//     }

//     fclose(filepointer);
//     closelog();

    
//     return 0;
// }