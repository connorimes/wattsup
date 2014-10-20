#ifndef UTIL_H
#define UTIL_H

int open_device(char * device_name, int * dev_fd);

int setup_serial_device(int dev_fd);

int wu_clear(int fd);

int wu_read(int fd, struct wu_packet * p);

void enable_field(char * name);

#endif
