require 'rspec'
require_relative 'foobar'

describe 'foobar' do
    context "Когда один из переданных параметров == 20" do

        it 'возвращает число 20, если хотя бы одно из двух введенных чисел == 20' do
            expect(foobar()).to eq (20)

        end

    end

    context "Когда оба из переданных параметров == 20" do

        it 'возвращает число 20, если хотя бы одно из двух введенных чисел == 20' do
            expect(foobar()).to eq (20)

        end

    end

    context "Когда ни один из переданных параметров != 20" do

        it 'возвращает число 20, если хотя бы одно из двух введенных чисел == 20' do
            expect(foobar()).to eq (20)

        end

    end
end

