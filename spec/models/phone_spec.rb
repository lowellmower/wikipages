require 'spec_helper'
require 'rails_helper'

describe Phone do
	it { validate_presence_of :number }
	it { validate_presence_of :contact_id }

	it { should belong_to :contact}
end