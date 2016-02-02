#ifndef UTIL_H
#define UTIL_H

#include "wattsup_common.h"

int parse_args(int argc, char ** argv);
int wu_check_store(int index, int dev_fd);
int open_device(char * device_name, int * dev_fd);
void dbg(const char * fmt, ...);
int setup_serial_device(int dev_fd);
int wu_clear(int fd);
static int wu_show_cal(int fd);
int wu_check_show(int index, int dev_fd);
int wu_start_log(void);
int wu_read_data(int fd);
int wu_stop_log(void);
int wu_show(int index, int dev_fd);

int wu_read(int fd, struct wu_packet * p);
void enable_field(char * name);

#endif
