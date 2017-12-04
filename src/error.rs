use std::io;

pub enum ConfigError{
    FileAlreadyLoaded,
    FileIo(io::Error),
    MissingField(&'static [&'static str]),
    UnsupportedAdapter(String),
}


impl From<io::Error> for ConfigError {
    fn from(error: io::Error) -> Self {
        ConfigError::FileIo(error)
    }
}