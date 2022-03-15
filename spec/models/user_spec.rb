require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate user' do

    it 'should save all fields are provided and passwords match' do
      user = User.new(name: 'Paul', email: 'paul@paul.com', password: 'matching', password_confirmation: 'matching')
      expect(user.save).to be true
    end

    it 'should return an error if no password is present' do
      user = User.new(name: 'Paul', email: 'newer@paul.com', password: '', password_confirmation: '')
      expect(user.errors.full_messages).to be_instance_of Array 
    end


    it 'should return an error if the password does not match the password confirmation ' do
      user = User.new(name: 'Paul', email: 'new@paul.com', password: 'matching', password_confirmation: 'notMatching')
      expect(user.errors.full_messages).to be_instance_of Array 
    end

    it 'should return an error if email is not left empty' do
      user = User.new(name: 'Paul', email: '', password: 'matching', password_confirmation: 'matching')
      expect(user.errors.full_messages).to be_instance_of Array 
    end

    it 'should return an error if name is not left empty' do
      user = User.new(name: '', email: 'this@guy.com', password: 'matching', password_confirmation: 'matching')
      expect(user.errors.full_messages).to be_instance_of Array 
    end

    it 'should return an error if the email is already present within the database' do
      user = User.new(name: 'Paul', email: 'paul@paul.com', password: 'matching', password_confirmation: 'matching')
      expect(user.errors.full_messages).to be_instance_of Array 
    end

    it 'should return an error if the password is shorter then 8 charaters' do
      user = User.new(name: 'paul', email: 'anewguy@guy.com', password: 'match', password_confirmation: 'match')
      expect(user.errors.full_messages).to be_instance_of Array 
    end
  end

  describe '.authenticate_with_credentials' do
    
  end

end
