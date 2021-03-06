C_ARGS=-fPIC -shared

C_SRC=$(wildcard src/*.c src/**/*.c)
C_TESTS=$(wildcard tests/*_tests.c tests/**/*_tests.c)
JAVA_SRC=$(wildcard src/*.java src/**/*.java)
JAVA_TESTS=$(wildcard tests/*_test.java tests/**/*_test.java)
C_OBJ=$(patsubst src/%,%,$(patsubst %.c,%.o,$(C_SRC)))
C_OUT=$(patsubst src/%,%,$(patsubst %.c,%.out,$(C_SRC)))
C_EXE=$(patsubst src/%,%,$(patsubst %.c,%,$(C_SRC)))
C_TESTS_OUT=$(patsubst tests/%,%,$(patsubst %.c,%,$(C_TESTS)))
JAVA_CLASS=$(patsubst src/%,%,$(patsubst %.java,%.class,$(JAVA_SRC)))
JAVA_TESTS_CLASS=$(patsubst tests/%,%,$(patsubst %.java,%.class,$(JAVA_TESTS)))

$(C_OBJ):$(C_SRC)
	$(CC) $(C_ARGS) -c src/$(patsubst %.o,%.c,$@) -o build/$@

$(C_OUT):$(C_SRC)
	$(CC) $(C_ARGS) src/$(patsubst %.out,%.c,$@) -o bin/$@

$(C_EXE):$(C_SRC)
	$(CC) $(C_ARGS) src/$(patsubst %,%.c,$@) -o bin/$@

$(C_TESTS_OUT):$(C_TESTS)
	$(CC) tests/$(patsubst %,%.c,$@) -o tmp/$@

$(JAVA_CLASS):$(JAVA_SRC)
	@ python ./pro/java_class.py $(patsubst %.class,%.java,$@)

$(JAVA_TESTS_CLASS):$(JAVA_TESTS)
	@ python ./pro/java_tests_class.py $(patsubst %.class,%.java,$@)

.PHONY:clean
clean:
	@ python ./pro/clean.py

.PHONY:renew
renew:
	@ python ./pro/renew.py
	
.PHONY:addjar
addjar:
	@ python ./pro/addjar.py	
	
.PHONY:test
test:
	@ python ./pro/test.py
