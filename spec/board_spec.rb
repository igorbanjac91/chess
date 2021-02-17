require "spec_helper"


module Chess
  RSpec.describe Board do 

    let(:board) { Board.new }

    describe "#grid" do 

      it 'has 8 rows' do 
        expect(board.grid.count).to eq(8) 
      end

      it 'has 8 tails for each row' do 
        board.grid.each do |row|
          expect(row.count).to eq(8)
          expect(row).to all( be_a(Tile))
        end
      end
    end

    before(:each) do 
      board.arrange_pieces
    end

    describe "#black_piece?" do 


      it 'return true when the coordinates point to a black piece' do 
        expect(board.black_piece?([1, 6])).to be true
      end
      
      it 'return false when the coordinates point to a white piece' do 
        expect(board.black_piece?([1, 1])).to be false
      end
      
      it 'return false when the coordinates point to an empty tail' do 
        expect(board.black_piece?([4, 5])).to be false
      end
      
    end
    
    describe "#white_piece?" do
      
      it 'return true when the coordinates point to a white piece' do 
        expect(board.white_piece?([1, 1])).to be true
      end
      
      it 'return false when the coordinates point to an empty tail' do 
        expect(board.white_piece?([4, 5])).to be false
      end
      
      it 'return false when the coordinates point to a black piece' do 
        expect(board.white_piece?([1, 6])).to be false
      end

    end

  end
end