FROM docker.io/haskell:latest
RUN mkdir walkTill-hs
WORKDIR walkTill-hs
COPY main.hs main.hs
COPY walkTill.hs walkTill.hs
RUN ghc walkTill.hs main.hs
CMD ["./main"]
