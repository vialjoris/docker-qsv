FROM ubuntu:22.04

# Update default packages
RUN apt-get -qq update

# Get Ubuntu packages
RUN apt-get install -y -q \
    build-essential \
    curl \    
    clang

# Install rust latest
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Install qsv with cargo
# https://github.com/jqnatividad/qsv 
RUN cargo install qsv --locked --bin qsv --features feature_capable

# Copy script who use qsv
COPY ./run.sh /run.sh
RUN chmod +x /run.sh
CMD tail -f /dev/null
