# nextpnr Issue 235 supplement

This project demonstrates the problem with [nextpnr](https://github.com/YosysHQ/nextpnr) noted in [issue 235](https://github.com/YosysHQ/nextpnr/issues/235) regarding processing lpf contraint files differently depending on whether they are unix format (LF line delimiters) or Windows/DOS format (CRLF line delimiters).

Original code is from https://github.com/DoctorWkt/ULX3S-Blinky, with a modified local constraint file: `ulx3s_v20.lpf`.
 
In order to facilitate changing formats, the `dos2unix` and `unix2dos` commands are used:

```
sudo apt-get install dos2unix
```

to run the demo:

```
git clone https://github.com/gojimmypi/nextpnr-issue235.git
cd nextpnr-issue235
chmod +x demo.sh
./demo.sh
```

The output should look like this:

```
$ ./demo.sh


Testing non-error condition...
dos2unix: converting file ulx3s_v20.lpf to Unix format...
335 warnings, 0 errors


Testing error condition...
unix2dos: converting file ulx3s_v20.lpf to DOS format...
ERROR: unexpected end of LPF file
335 warnings, 1 error

```

see the complete files `working.log` and `error.log` for full output.

