#include<stdio.h>
#include<stdlib.h>
#include<syslog.h>

int main (int argc, char *argv[] ){
   if (argc != 3) {
     syslog(LOG_ERR,"Error: Invalid parameters passed writer.c <writefile> <writestr");
     exit(1);
   }

   char *writefile = argv[1];
   char *writestr = argv[2];

   openlog(argv[0], LOG_PID, LOG_USER);

   FILE *file = fopen(writefile, "w");
   if(file == NULL) {
      syslog(LOG_ERR, "Error: Failed to openfile.");
      exit(1);
   }

   if(fprintf (file, "%s\n", writestr) < 0) {
      syslog(LOG_ERR,"Error: Failed to write to a file.");
      exit(1);
   }

   fclose(file);

   syslog(LOG_INFO, "%s created successfully" , writefile);
   closelog();
   return 0;





}
