FROM eclipse-temurin:17-jdk AS build
WORKDIR /app
COPY project/ project/
COPY build.sbt ./
RUN sbt --client compile || true
COPY src/ src/
RUN sbt compile

FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/ ./
EXPOSE 0
CMD ["sbt", "run"]