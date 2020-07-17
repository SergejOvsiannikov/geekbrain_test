require 'spec_helper'

describe Courses::Groups::Students::Registration do
  describe '#call' do
    subject { described_class.new(group_id: group.id, course_id: course.id).call(email) }

    describe 'success flow' do
      let!(:course) { create :course }
      let!(:exist_student) { create :student, email: 'exist@email.com' }
      let!(:group) { create :group, course: course, students: [exist_student] }
      let!(:email) { 'test@mail.com' }


      context 'asign exist student' do
        let!(:student) { create :student, email: email }

        it { expect { subject }.to change{ group.reload.students.count }.from(1).to(2) }
        it { expect { subject }.to change{ Student.count }.by(0) }
      end

      context 'asign new student' do
        it { expect { subject }.to change{group.reload.students.count}.from(1).to(2) }
        it { expect { subject }.to change{Student.count}.by(1) }
      end
    end

    describe 'error flow' do
      context 'email exist' do
        let!(:email) { 'exist@email.com' }
        let!(:exist_student) { create :student, email: email }
        let!(:course) { create :course }
        let!(:group) { create :group, course: course, students: [exist_student] }

        it { expect { subject }.to raise_error(ActiveRecord::RecordNotUnique) }
      end

      context 'no course' do
        let!(:course) { double('course', { id: nil }) }
        let!(:group) { double('group', { id: nil }) }

        it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
      end

      context 'no group' do
        let!(:course) { create :course }
        let!(:group) { double('group', { id: nil }) }

        it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
      end
    end
  end
end
