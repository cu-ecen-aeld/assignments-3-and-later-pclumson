
CC = gcc 
CROSS_COMPILE ?= 

ifeq ($(CROSS_COMPILE),)
		TARGET = writer 
else 
		TARGET = writer-arm 
endif 

CFLAGS = -Werror 

all: $(TARGET)


writer: writer.c 
		$(CC) $(CFLAGS) writer.c -o writer 

writer-arm: writer.c 
		$(CROSS_COMPILE)$(CC) $(CFLAGS) write.c writer 


clean:
		rm -f writer *.o 










# CC = gcc 
# CFLAGS = -Wall -Wextra
# TARGET = writer 
# OBJFILES = writer.o 

# ifdef CROSS_COMPILE
# 	CC = $(CROSS_COMPILE)gcc 
# endif 

# .PHONY: all clean 

# all: $(TARGET)

# $(TARGET): $(OBJFILES)
# 		$(CC) $(CFLAGS) -o $@ $^ 


# %.o: %.c 
# 		$(CC) $(CFLAGS) -c -o $@ $< 

# clean:
# 		rm -f $(TARGET) $(OBJFILES)







# CC = gcc 
# CFLAGS = -Wall -Wextra
# TARGET = writer 
# OBJFILES = writer.o 

# ifdef CROSS_COMPILE
# 	CC = $(CROSS_COMPILE)gcc 
# endif 

# .PHONY: all clean 

# all: $(TARGET)

# $(TARGET): $(OBJFILES)
# 		$(CC) $(CFLAGS) -o $@ $^ 


# %.o: %.c 
# 		$(CC) $(CFLAGS) -c -o $@ $< 

# clean:
# 		rm -f $(TARGET) $(OBJFILES)