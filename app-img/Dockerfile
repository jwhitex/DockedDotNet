FROM microsoft/aspnetcore

RUN apt-get update
RUN apt-get install -y wget
RUN wget -qO- https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

WORKDIR /home/local/app

COPY out .

ENTRYPOINT ["dotnet", "Program.dll"]

