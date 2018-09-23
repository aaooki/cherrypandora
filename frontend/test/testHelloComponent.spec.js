import {shallowMount} from '@vue/test-utils'
import HelloComponent from '../components/HelloComponent.vue'

const wrapper = shallowMount(HelloComponent)

describe('HelloWorld.vue', function() {
  it('says hello from ...', function() {
    const h1 = wrapper.find('h1')
    expect(h1.text()).toBe('Hello from the HelloComponent')

  });
});
