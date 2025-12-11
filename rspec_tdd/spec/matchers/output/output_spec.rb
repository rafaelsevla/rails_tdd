describe 'Output matcher' do
  it { expect { puts 'rafa' }.to output.to_stdout }
  it { expect { print 'rafa' }.to output("rafa").to_stdout }
  it { expect { puts 'rafa dev' }.to output(/rafa/).to_stdout }

  it { expect { warn 'rafa' }.to output.to_stderr }
  it { expect { warn 'rafa' }.to output("rafa\n").to_stderr }
  it { expect { warn 'rafa dev' }.to output(/rafa/).to_stderr }
end