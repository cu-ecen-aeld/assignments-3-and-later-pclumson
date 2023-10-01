


#include <syslog.h>
#include <fcntl.h>
#include <stddef.h>
#include <unistd.h>
#include <string.h>

//Replacing symbolic permission constants with their octal representations directly.
#ifndef S_IRWXU
#define S_IRWXU 0700
#endif

#ifndef S_IRWXG
#define S_IRWXG 0070
#endif

#ifndef S_IRWXO
#define S_IRWXO 0007
#endif


/***************************************** Main Function *******************************************************/
int main(int argc, char* argv[]){						/*argc is the number of arguments and argv are the argument strings */
  if (argc!=3){                                                                  /* Checking for valid no. of args */
    openlog(NULL, 0, LOG_USER);                                                  /* Open Log File */ 
    syslog(LOG_ERR, "Invalid Number of Arguments: %d\n", argc);                  /* Error Logging */
    closelog();                                                                  
    return 1;
  }
  
  char *writerfile = argv[1];
  char *writestr = argv[2];
  int fp = open(writerfile, O_CREAT | O_WRONLY , S_IRWXU | S_IRWXG | S_IRWXO);      /* Open the file to write */
  if (fp != -1){                                                                 /* Check validity of the file pointer */
    int i = strlen(writestr);                                                     /* Check for total chars written into the file */
    int wr_status = write(fp, writestr, i);                                       /* Write into file */
    openlog(NULL, 0, LOG_USER);                                                  
    if (wr_status==-1){                                                          /* Check for successful write action */
      syslog(LOG_ERR, "Write Operation failed with return -1\n\r");
      closelog();
      close(fp);                                                                 /* Close file descriptor */
      return 1;
    }
    else if (wr_status < i){                                                     /* Check if partial no. of bytes written */
      syslog(LOG_ERR, "Not all bytes are written to the file W - \n\r");
      closelog();
      close(fp);                                                                 /* Close file descriptor */
      return 1;
    }
    else{									 /* Case of write operation successful */ 
      syslog(LOG_DEBUG, "Write Operation is Successful \n\r");
      closelog();
      close(fp);                                                                 /* Close file descriptor */
    }
  }
  else{
    openlog(NULL, 0, LOG_USER);                                                  /* Open Log file */
    syslog(LOG_ERR, "File Descriptor failed with return -1\n\r");                /* Log error message */
    closelog();									 /* Close file descriptor */
    return 1;
  }
  return 0;
}










// #include <stdio.h>
// #include <stdlib.h>
// #include <syslog.h>
// #include <string.h>


// #define LOG_TAG "writer"

// int main(int argc, char*argv[])
// {
//     openlog( LOG_TAG, LOG_PID, LOG_USER);

//     if(argc != 3)
//     {
//         syslog(LOG_ERR, " Need two arguments ");
//         syslog(LOG_ERR, "1)Need a full path.");
//         syslog(LOG_ERR, "2)Please enter a text stream. ");
//         closelog();
//         return 1;

//     }

//     const char *f_name = argv[1];
//     const char *writestr = argv[2];

    
//     FILE * fpt = fopen(f_name, "w");
    
//     if(fpt == NULL)
//     {
//         syslog(LOG_ERR, "Failed to open file %s", f_name);
//         closelog();
//         return 1;
//     }


//     // else{
//     //     fputs(argv[2], fpt);
//     //     fputs("\n", fpt);
//     //     syslog(LOG_DEBUG, "Writing %s", argv[2], argv[1]);

//     // }

//     fprintf(fpt, "%s\n", writestr);

//     fclose(fpt);

//     syslog(LOG_DEBUG, "Writing \"%s\" to \"%s\"", writestr, f_name);

//     closelog();

    
//     return 0;
// }













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