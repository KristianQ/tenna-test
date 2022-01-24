require_relative './thread_synchronization'

describe ThreadSynchronization do
  let(:mutex) { Mutex.new }
  let(:odd_thread) { ThreadSynchronization.new('Thread 1', 1, mutex) }
  let(:even_thread) { ThreadSynchronization.new('Thread 2', 0, mutex) }

  before do
    allow(STDOUT).to receive(:puts)
  end

  describe 'run' do
    it 'returns a Thread' do
      expect(odd_thread.run).to be_a(Thread)
    end

    it 'removes the first item from $sequence' do
      $sequence = [1]

      odd_thread.run.join

      expect($sequence).to be_empty
    end

    it 'exits the loop if $sequence is empty' do
      $sequence = [1]
      allow($sequence).to receive(:[]).and_call_original
      expect($sequence).to receive(:[]).once

      odd_thread.run.join
    end

    it 'prints the numbers using the correct thread' do
      $sequence = [1, 2, 3, 4]

      expect(STDOUT).to receive(:puts).with("Thread 1: The number is '1'")
      expect(STDOUT).to receive(:puts).with("Thread 2: The number is '2'")
      expect(STDOUT).to receive(:puts).with("Thread 1: The number is '3'")
      expect(STDOUT).to receive(:puts).with("Thread 2: The number is '4'")

      [odd_thread.run, even_thread.run].each(&:join)
    end
  end
end
