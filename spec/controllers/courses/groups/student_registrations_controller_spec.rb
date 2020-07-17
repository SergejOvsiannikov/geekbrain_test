require 'rails_helper'

describe Courses::Groups::StudentRegistrationsController do
  describe 'POST create' do
    let (:params) do
      {
        group_id: group.id,
        course_id: course.id,
        student: { email: email }
      }
    end

    subject { post :create, params: params }

    describe 'success flow' do
      let(:course) { create :course }
      let(:group) { create :group, course: course }
      let(:email) { 'test@test.com' }

      context 'redirect to /cources' do
        it { is_expected.to have_http_status(302) }
        it { is_expected.to redirect_to('/courses') }
        it do
          subject
          expect(controller).
            to set_flash[:success].to(/You successfully assigned to group!/)
        end
      end

      context 'register student to course' do
        it { expect { subject }.to change { group.reload.students.count }.from(0).to(1) }
        it { expect { subject }.to change { Student.count }.by(1) }
      end
    end

    describe 'error flow' do
      context 'invalid course' do
        let(:course) { double('course', { id: 1 }) }
        let(:group) { double('group', { id: 2 }) }
        let(:email) { 'test@test.com' }

        it { is_expected.to have_http_status(302) }
        it { expect { subject }.to change{ Student.count }.by(0) }

        it do
          subject
          expect(controller).
            to set_flash[:danger].to(/Couldn't find Course with/)
        end
      end
    end
  end
end
