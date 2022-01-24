class ThreadSynchronization
  def initialize(identifier, remainder, mutex)
    @identifier = identifier
    @remainder = remainder
    @mutex = mutex
  end

  def run
    Thread.new do
      loop do
        # force $sequence to be flushed to memory before using it
        @mutex.synchronize do
          $sequence
        end

        break if $sequence.empty?

        n = $sequence[0]
        next unless n % 2 == @remainder

        @mutex.synchronize do
          puts "#{@identifier}: The number is '#{n}'"

          # remove the number from the list
          $sequence.shift
        end
      end
    end
  end
end

# run only if the script is being executed from command line
if __FILE__ == $0
  # Mutext is used to synchronize the access to shared resources (ie: the $sequence array)
  mutex = Mutex.new

  $sequence = (1..100).to_a

  odd_thread_sync = ThreadSynchronization.new('Thread 1', 1, mutex)
  even_thread_sync = ThreadSynchronization.new('Thread 2', 0, mutex)

  threads = []
  threads << odd_thread_sync.run
  threads << even_thread_sync.run

  # wait until all threads are finished before exiting the program
  threads.each(&:join)
end
