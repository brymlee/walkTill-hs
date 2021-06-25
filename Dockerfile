FROM docker.io/haskell:latest
RUN mkdir walkTill-hs
WORKDIR walkTill-hs
COPY walkTill.hs walkTill.hs
COPY test.hs test.hs
COPY main.hs main.hs
RUN ghc walkTill.hs test.hs main.hs
CMD ["./main"]
