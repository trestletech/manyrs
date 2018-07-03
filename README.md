## manyrs

To build, from this directory:

```
docker build -t manyrs .
```

This will take an extraordinarily long time.

### Development

From a Ubuntu 16.04 machine:

```
apt-get update
apt-get install -yq docker.io git tmux
git clone https://github.com/trestletech/manyrs.git
cd manyrs
tmux # to be able to disconnect and resume session
docker build -t trestletech/manyrs .
...
```
