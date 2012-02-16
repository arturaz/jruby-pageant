# jruby-pageant

This is a small gem for packaging up JNA/JSCH jars.

Its original purpose was to support JRuby + Windows + Pageant in net/ssh.

It bundles jsch-agent-proxy (<https://github.com/ymnk/jsch-agent-proxy>),
jsch (<http://www.jcraft.com/jsch/>) and JNA (<https://github.com/twall/jna>).

# Usage

    require 'jruby_pageant'

    agent_proxy = JRubyPageant.create
    if agent_proxy.is_running
      # This is Java com.jcraft.jsch.agentproxy.Identity[]
      identities = agent_proxy.get_identities
      puts "Known identities: #{identities.size}"
      identities.each do |identity|
        # This is Java byte[] containing the key.
        blob = identity.get_blob
        # You can convert it to string:
        puts "  blob: #{String.from_java_bytes(blob)}"
        # This is Java byte[] containing the key comment.
        comment = identity.get_comment
        puts "  comment: #{String.from_java_bytes(comment)}"

        # Signing data is easy too!
        data = "My data"
        # This returns byte[]
        signed = agent_proxy.sign(blob, data.to_java_bytes)
        puts "  sign: #{data} -> #{String.from_java_bytes(signed)}"
      end
    else
      puts "Pageant is not running!"
    end

# Authors

This gem was written by Artūras Šlajus (<arturas.slajus@gmail.com>).

# License

This work is licensed under a Creative Commons Attribution 3.0 Unported License.

<http://creativecommons.org/licenses/by/3.0/>