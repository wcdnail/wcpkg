## Begin

```shell
cd /D %VCPKG_ROOT%
call bootstrap-vcpkg.bat -disableMetrics
```

```bash
cd $VCPKG_ROOT
chmod +x ./bootstrap-vcpkg.sh
./bootstrap-vcpkg.sh -disableMetrics
```

## OpenSSL

fips
ssl3
tools
weak-ssl-ciphers

```shell
vcpkg install openssl[fips,ssl3,tools]:x64-windows
```

```bash
./vcpkg install openssl[fips,ssl3,tools]:x64-linux
```
