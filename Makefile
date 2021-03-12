.DEFAULT_GOAL := default

default:
	cd modules/WALA && ./gradlew assemble
	cd modules/gumtree && ./gradlew assemble
	cd modules/junit-quickcheck && mvn package -DskipTests
	cd modules/org.aspectj && mvn package -DskipTests
	cd modules/JQF && mvn package -DskipTests
