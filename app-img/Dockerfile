FROM microsoft/aspnetcore

#Can't get ARG to work.. on d-c up does not pass values?'

RUN apt-get update
RUN apt-get install -y wget
RUN wget -qO- https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

WORKDIR /home/local/app

COPY out .

ENTRYPOINT ["dotnet", "Program.dll"]

