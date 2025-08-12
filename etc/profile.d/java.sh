export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MAVEN_OPTS=-Dmaven.repo.local="$XDG_DATA_HOME"/maven/repository
export MAVEN_ARGS="--settings $XDG_CONFIG_HOME/maven/settings.xml"
