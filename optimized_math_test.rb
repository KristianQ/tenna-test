require_relative './optimized_math'

describe OptimizedMath do
  subject(:optimized_math) { OptimizedMath.new }

  before do
    allow(STDOUT).to receive(:puts)
  end

  describe 'start' do
    before do
      allow(optimized_math).to receive(:message_for)
    end

    describe 'calling :message_for' do
      it 'should call :message_for passing the number 1 as argument' do
        expect(optimized_math).to receive(:message_for).with(1)
        optimized_math.start
      end

      it 'should call :message_for passing the number 2 as argument' do
        expect(optimized_math).to receive(:message_for).with(2)
        optimized_math.start
      end

      it 'should call :message_for passing the number 3 as argument' do
        expect(optimized_math).to receive(:message_for).with(3)
        optimized_math.start
      end

      it 'should call :message_for passing the number 100 as argument' do
        expect(optimized_math).to receive(:message_for).with(100)
        optimized_math.start
      end
    end

    describe 'calling :puts' do
      before do
        allow(optimized_math).to receive(:message_for).with(1).and_return('Message for 1')
      end

      it 'calls :puts passing the result from :message_for' do
        expect(STDOUT).to receive(:puts).with('Message for 1')
        optimized_math.start
      end
    end
  end

  describe 'message_for' do
    context 'when the number is odd' do
      it { expect(optimized_math.message_for(1)).to eq("The number '1' is odd.") }
      it { expect(optimized_math.message_for(5)).to eq("The number '5' is odd.") }
      it { expect(optimized_math.message_for(7)).to eq("The number '7' is odd.") }
    end

    context 'when the number is even' do
      it { expect(optimized_math.message_for(2)).to eq("The number '2' is even.") }
      it { expect(optimized_math.message_for(4)).to eq("The number '4' is even.") }
      it { expect(optimized_math.message_for(8)).to eq("The number '8' is even.") }
    end

    context 'when the number is divisible by 3' do
      it { expect(optimized_math.message_for(3)).to eq("The number '3' is divisible by three.") }
      it { expect(optimized_math.message_for(9)).to eq("The number '9' is divisible by three.") }
      it { expect(optimized_math.message_for(15)).to eq("The number '15' is divisible by three.") }
    end

    context 'when the number is divisible by 2 and 3' do
      it { expect(optimized_math.message_for(6)).to eq("The number '6' is divisible by two and three.") }
      it { expect(optimized_math.message_for(12)).to eq("The number '12' is divisible by two and three.") }
      it { expect(optimized_math.message_for(18)).to eq("The number '18' is divisible by two and three.") }
    end
  end
end
