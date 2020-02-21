# Logging in Python

## Table of Contents
1. [Iinitializing the logger](			#Iinitializing-the-logger)
1. [Using the Logger](					#Using-the-Logger)
1. [Logger Levels](						#Logger-Levels)
1. [Formatting the Logger](				#Formatting-the-Logger)
1. [Logging Stack Traces](				#Logging-Stack-Traces)
1. [Streaming the Log to the Console](	#Streaming-the-Log-to-the-Console)
1. [Streaming the Log to a File](		#Streaming-the-Log-to-a-File)
1. [Example Usage](						#Example-Usage)

## Iinitializing the logger
```python
import logging

log = logging.getLogger('log_name')
```

## Using the Logger
```python
log.info('message')
log.debug('yo, this happens too')
```

### Logger Levels:
In order of impact.

1) CRITICAL
1) ERROR 
1) WARNING
1) INFO
1) DEBUG
1) NOTSET

## Formatting the Logger
```python
log.basicConfig(format='%(asctime)s %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p')
```
There are many different fields which can be used for the log, here is a list of a few:  

Item | Implementation | Example  
---- | :------------: | -------  
asctime | ```%(asctime)s``` | NoneSoFar
funcName | ```%(funcName)s``` | NoneSoFar
levelname | ```%(levelname)s``` | NoneSoFar
lineno | ```%(lineno)d``` | NoneSoFar
message | ```%(message)s``` | NoneSoFar
module | ```%(module)s``` | NoneSoFar
name | ```%(name)s``` | NoneSoFar
pathname | ```%(pathname)s``` | NoneSoFar
thread | ```%(thread)d``` | NoneSoFar
threadName | ```%(threadName)s``` | NoneSoFar

Do note that you can allocate character spaces for each field. For example:
```python
log.basicConfig(format='%(asctime)s %(message)s')
```
would produce
```
log output
```

## Logging Stack Traces
You can log a stack trace with the parameter
```python
exc_info=True
```
Here is an example from [Intrepid](https://github.com/caswolfe/Intrepid/blob/ea75cb95fa5bebf9342b3b0d33205a97877bea31/MasterJobRunner.py#L43-L45):
```python
except Exception as e:
	log.debug('Stack Trace:', exc_info=True)
```

## Streaming the Log to the Console
```python
logging_handler_console = logging.StreamHandler()
logging_handler_console.setLevel(logging.DEBUG)
logging_format = logging.Formatter('%(asctime)s - %(threadName)10s -  %(filename)25s - %(lineno)4d - %(levelname)9s - %(message)s')
logging_handler_console.setFormatter(logging_format)
log.addHandler(logging_handler_console)
```

## Streaming the Log to a File
```python
logging_handler_file = logging.FileHandler(log_filename)
logging_handler_file.setLevel(logging.DEBUG)
logging_format = logging.Formatter('%(asctime)s - %(threadName)10s -  %(filename)25s - %(lineno)4d - %(levelname)9s - %(message)s')
logging_handler_file.setFormatter(logging_format)
log.addHandler(logging_handler_file)
```

## Example Usage
### [Intrepid:](https://github.com/caswolfe/Intrepid/blob/ea75cb95fa5bebf9342b3b0d33205a97877bea31/MasterJobRunner.py#L14-L27)  
Creates a log such that any logged message will be both 1) recorded in file and 2) displayed in the console.
```python
log_filename = ("Logs/" + datetime.datetime.now().strftime("%Y-%m-%d_%H:%M:%S") + "_runtime.log")
log = logging.getLogger('Intrepid')
log.setLevel(logging.DEBUG)
logging_handler_console = logging.StreamHandler()
logging_handler_file = logging.FileHandler(log_filename)
logging_handler_console.setLevel(logging.DEBUG)
logging_handler_file.setLevel(logging.DEBUG)
logging_format = logging.Formatter('%(asctime)s - %(threadName)10s -  %(filename)25s - %(lineno)4d - %(levelname)9s - %(message)s')
logging_handler_console.setFormatter(logging_format)
logging_handler_file.setFormatter(logging_format)
log.addHandler(logging_handler_console)
log.addHandler(logging_handler_file)
log.info("Starting MasterJobRunner")
```

## Userfull Links
### [Python Docs](https://docs.python.org/3/library/logging.html)