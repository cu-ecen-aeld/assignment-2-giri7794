#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    FILE *fp;

    openlog("writer", LOG_PID, LOG_USER);

    if (argc != 3)
    {
        syslog(LOG_ERR, "Invalid number of arguments");
        return 1;
    }

    char *filepath = argv[1];
    char *text = argv[2];

    syslog(LOG_DEBUG, "Writing %s to %s", text, filepath);

    fp = fopen(filepath, "w");
    if (fp == NULL)
    {
        syslog(LOG_ERR, "Failed to open file %s", filepath);
        closelog();
        return 1;
    }

    if (fprintf(fp, "%s", text) < 0)
    {
        syslog(LOG_ERR, "Failed to write to file %s", filepath);
        fclose(fp);
        closelog();
        return 1;
    }

    fclose(fp);
    closelog();

    return 0;
}